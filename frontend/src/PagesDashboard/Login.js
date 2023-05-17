import React from "react";
import axios from 'axios'

export default class Login extends React.Component {
    constructor() {
        super()
        this.state = {
            email_user: "",
            password_user: "",
            isModalOpen: false,
            logged: false,
        }
    }

    handleChange = (e) => {
        this.setState({
            [e.target.name]: e.target.value
        })
    }

    handleLogin = (e) => {
        e.preventDefault()
        let data = {
            email: this.state.email_user,
            password: this.state.password_user
        }
        let url = "http://localhost:8000/user/login"
        axios.post(url, data)
            .then(response => {
                this.setState({ logged: response.data.data.logged })
                if (response.status === 200) {
                    let id = response.data.data.id
                    let token = response.data.data.token
                    let role = response.data.data.role
                    let email = response.data.data.email
                    let nama_user = response.data.data.nama_user
                    localStorage.setItem("id", id)
                    localStorage.setItem("token", token)
                    localStorage.setItem("role", role)
                    localStorage.setItem("email", email)
                    localStorage.setItem("nama_user", nama_user)
                    alert("Success Login")
                    window.location.href = "/dashboard"
                } else {
                    alert(response.data.message)
                    this.setState({ message: response.data.message })

                }
            })
            .catch(error => {
                console.log("error", error.response.status)
                if (error.response.status === 500 || error.response.status === 404) {
                    window.alert("Failed to login dashboard");
                }
            })
    }

    render() {
        return (
            <div className="dashboard1">
                <section>
                    <div className="px-4 py-12 mx-auto max-w-7xl sm:px-6 md:px-12 lg:px-24 lg:py-24">
                        <div className="justify-center mx-auto text-left align-bottom transition-all transform bg-white rounded-lg sm:align-middle sm:max-w-2xl sm:w-full">
                            <div className="grid flex-wrap items-center justify-center grid-cols-1 mx-auto shadow-xl lg:grid-cols-2 rounded-xl">
                                <div className="w-full px-6 py-3">
                                    <div>
                                        <div className="mt-3 text-left sm:mt-5">
                                            <div className="inline-flex items-center w-full">
                                                <h3 className="text-lg font-bold text-neutral-600 leading-6 lg:text-5xl">Welcome!</h3>
                                            </div>
                                            <div className="mt-4 text-base text-gray-500">
                                                <p>Cumu Hotel: Your Serene Haven for Business and Leisure</p>
                                            </div>
                                        </div>
                                    </div>

                                    <form onSubmit={this.handleLogin}>
                                        <div className="mt-6 space-y-2">
                                            <div>
                                                <label htmlFor="email" className="sr-only">Email</label>
                                                <input type="text" name="email_user" id="email" className="block w-full px-5 py-3 text-base text-neutral-600 placeholder-gray-300 transition duration-500 ease-in-out transform border border-transparent rounded-lg bg-gray-50 focus:outline-none focus:border-transparent focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-300" placeholder="Enter your email" value={this.state.email_user} onChange={this.handleChange} />
                                            </div>
                                            <div>
                                                <label htmlFor="password" className="sr-only">Password</label>
                                                <input type="password" name="password_user" id="password" className="block w-full px-5 py-3 text-base text-neutral-600 placeholder-gray-300 transition duration-500 ease-in-out transform border border-transparent rounded-lg bg-gray-50 focus:outline-none focus:border-transparent focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-300" placeholder="Enter your password" value={this.state.password_user} onChange={this.handleChange} />
                                            </div>
                                            <div className="flex flex-col mt-4 lg:space-y-2">
                                                <button type="submit" name="login" className="flex items-center justify-center w-full px-10 py-4 text-base font-medium text-center text-white transition duration-500 ease-in-out transform bg-blue-600 rounded-xl hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">Log In</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div className="order-first hidden w-full lg:block">
                                    <img className="object-cover h-full bg-cover rounded-l-lg" src="https://images.unsplash.com/photo-1563911302283-d2bc129e7570?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80" alt="" />
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        );
    }
}
